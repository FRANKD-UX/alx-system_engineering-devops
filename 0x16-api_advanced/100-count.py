#!/usr/bin/python3
"""
Recursive function that queries the Reddit API, parses hot article titles,
and prints a sorted count of given keywords (case-insensitive).
"""

import requests
from collections import Counter

def count_words(subreddit, word_list, word_count=None, after=None):
    """
    Recursively queries the Reddit API and counts occurrences of keywords.
    :param subreddit: The subreddit to query.
    :param word_list: List of keywords to count.
    :param word_count: Dictionary to store word counts.
    :param after: The pagination parameter for recursive calls.
    """
    if word_count is None:
        word_count = Counter()
    
    headers = {'User-Agent': 'Mozilla/5.0'}
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    params = {'limit': 100, 'after': after}
    response = requests.get(url, headers=headers, params=params, allow_redirects=False)
    
    if response.status_code != 200:
        return
    
    try:
        data = response.json()
        posts = data.get("data", {}).get("children", [])
        
        for post in posts:
            title = post["data"].get("title", "").lower().split()
            for word in word_list:
                word_lower = word.lower()
                word_count[word_lower] += title.count(word_lower)
        
        after = data.get("data", {}).get("after")
        if after:
            return count_words(subreddit, word_list, word_count, after)
        
        sorted_words = sorted(
            [(word, count) for word, count in word_count.items() if count > 0],
            key=lambda x: (-x[1], x[0])
        )
        
        for word, count in sorted_words:
            print(f"{word}: {count}")
    except ValueError:
        return
