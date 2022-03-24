( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b940 - block
    b820 - block
    b173 - block
    b159 - block
    b756 - block
    b165 - block
    b900 - block
    b708 - block
    b496 - block
    b181 - block
    b677 - block
    b980 - block
    b104 - block
    b564 - block
    b816 - block
    b478 - block
    b717 - block
    b396 - block
    b402 - block
    b15 - block
    b63 - block
    b806 - block
    b801 - block
    b729 - block
    b32 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b940 b91 )
    ( on b820 b940 )
    ( on b173 b820 )
    ( on b159 b173 )
    ( on b756 b159 )
    ( on b165 b756 )
    ( on b900 b165 )
    ( on b708 b900 )
    ( on b496 b708 )
    ( on b181 b496 )
    ( on b677 b181 )
    ( on b980 b677 )
    ( on b104 b980 )
    ( on b564 b104 )
    ( on b816 b564 )
    ( on b478 b816 )
    ( on b717 b478 )
    ( on b396 b717 )
    ( on b402 b396 )
    ( on b15 b402 )
    ( on b63 b15 )
    ( on b806 b63 )
    ( on b801 b806 )
    ( on b729 b801 )
    ( on b32 b729 )
    ( clear b32 )
  )
  ( :tasks
    ( Make-25Pile b940 b820 b173 b159 b756 b165 b900 b708 b496 b181 b677 b980 b104 b564 b816 b478 b717 b396 b402 b15 b63 b806 b801 b729 b32 )
  )
)
