#!/usr/bin/python3
"""
Recursive function to query the Reddit API and return a list of hot article titles.
"""
import requests

def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively queries the Reddit API to get all hot articles for a given subreddit.
    :param subreddit: The subreddit to query.
    :param hot_list: The list of hot article titles (accumulated over recursive calls).
    :param after: The pagination parameter to get the next set of results.
    :return: List of titles or None if subreddit is invalid.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': 'Mozilla/5.0'}
    params = {'limit': 100, 'after': after}  # 100 is the max limit per request
    
    response = requests.get(url, headers=headers, params=params, allow_redirects=False)
    
    if response.status_code != 200:
        return None  # Invalid subreddit or request failed
    
    data = response.json()
    
    # Extract posts
    posts = data.get("data", {}).get("children", [])
    
    if not posts:
        return hot_list if hot_list else None
    
    # Append titles to hot_list
    for post in posts:
        hot_list.append(post["data"].get("title"))
    
    # Check for pagination (if there's a next page)
    after = data.get("data", {}).get("after")
    if after:
        return recurse(subreddit, hot_list, after)
    else:
        return hot_list
