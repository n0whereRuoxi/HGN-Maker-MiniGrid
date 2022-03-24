( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b817 - block
    b258 - block
    b874 - block
    b99 - block
    b773 - block
    b852 - block
    b64 - block
    b76 - block
    b178 - block
    b256 - block
    b653 - block
    b157 - block
    b594 - block
    b403 - block
    b314 - block
    b978 - block
    b296 - block
    b218 - block
    b40 - block
    b742 - block
    b199 - block
    b656 - block
    b696 - block
    b338 - block
    b366 - block
    b405 - block
    b536 - block
    b115 - block
    b503 - block
    b201 - block
    b126 - block
    b645 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b817 )
    ( on b258 b817 )
    ( on b874 b258 )
    ( on b99 b874 )
    ( on b773 b99 )
    ( on b852 b773 )
    ( on b64 b852 )
    ( on b76 b64 )
    ( on b178 b76 )
    ( on b256 b178 )
    ( on b653 b256 )
    ( on b157 b653 )
    ( on b594 b157 )
    ( on b403 b594 )
    ( on b314 b403 )
    ( on b978 b314 )
    ( on b296 b978 )
    ( on b218 b296 )
    ( on b40 b218 )
    ( on b742 b40 )
    ( on b199 b742 )
    ( on b656 b199 )
    ( on b696 b656 )
    ( on b338 b696 )
    ( on b366 b338 )
    ( on b405 b366 )
    ( on b536 b405 )
    ( on b115 b536 )
    ( on b503 b115 )
    ( on b201 b503 )
    ( on b126 b201 )
    ( on b645 b126 )
    ( on b457 b645 )
    ( clear b457 )
  )
  ( :tasks
    ( Make-32Pile b258 b874 b99 b773 b852 b64 b76 b178 b256 b653 b157 b594 b403 b314 b978 b296 b218 b40 b742 b199 b656 b696 b338 b366 b405 b536 b115 b503 b201 b126 b645 b457 )
  )
)
