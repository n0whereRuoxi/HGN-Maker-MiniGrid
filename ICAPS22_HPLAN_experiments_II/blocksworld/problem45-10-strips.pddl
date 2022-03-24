( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b22 - block
    b447 - block
    b825 - block
    b370 - block
    b124 - block
    b971 - block
    b845 - block
    b944 - block
    b194 - block
    b2 - block
    b526 - block
    b649 - block
    b450 - block
    b797 - block
    b985 - block
    b741 - block
    b766 - block
    b277 - block
    b547 - block
    b150 - block
    b342 - block
    b122 - block
    b40 - block
    b421 - block
    b873 - block
    b886 - block
    b688 - block
    b966 - block
    b665 - block
    b932 - block
    b613 - block
    b408 - block
    b927 - block
    b464 - block
    b513 - block
    b169 - block
    b237 - block
    b483 - block
    b345 - block
    b518 - block
    b511 - block
    b620 - block
    b440 - block
    b162 - block
    b781 - block
    b573 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b22 )
    ( on b447 b22 )
    ( on b825 b447 )
    ( on b370 b825 )
    ( on b124 b370 )
    ( on b971 b124 )
    ( on b845 b971 )
    ( on b944 b845 )
    ( on b194 b944 )
    ( on b2 b194 )
    ( on b526 b2 )
    ( on b649 b526 )
    ( on b450 b649 )
    ( on b797 b450 )
    ( on b985 b797 )
    ( on b741 b985 )
    ( on b766 b741 )
    ( on b277 b766 )
    ( on b547 b277 )
    ( on b150 b547 )
    ( on b342 b150 )
    ( on b122 b342 )
    ( on b40 b122 )
    ( on b421 b40 )
    ( on b873 b421 )
    ( on b886 b873 )
    ( on b688 b886 )
    ( on b966 b688 )
    ( on b665 b966 )
    ( on b932 b665 )
    ( on b613 b932 )
    ( on b408 b613 )
    ( on b927 b408 )
    ( on b464 b927 )
    ( on b513 b464 )
    ( on b169 b513 )
    ( on b237 b169 )
    ( on b483 b237 )
    ( on b345 b483 )
    ( on b518 b345 )
    ( on b511 b518 )
    ( on b620 b511 )
    ( on b440 b620 )
    ( on b162 b440 )
    ( on b781 b162 )
    ( on b573 b781 )
    ( clear b573 )
  )
  ( :goal
    ( and
      ( clear b22 )
    )
  )
)
