( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b709 - block
    b81 - block
    b19 - block
    b809 - block
    b242 - block
    b997 - block
    b361 - block
    b260 - block
    b413 - block
    b304 - block
    b968 - block
    b963 - block
    b492 - block
    b645 - block
    b736 - block
    b34 - block
    b497 - block
    b356 - block
    b119 - block
    b58 - block
    b418 - block
    b80 - block
    b794 - block
    b992 - block
    b292 - block
    b984 - block
    b122 - block
    b263 - block
    b329 - block
    b993 - block
    b26 - block
    b327 - block
    b253 - block
    b808 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b709 )
    ( on b81 b709 )
    ( on b19 b81 )
    ( on b809 b19 )
    ( on b242 b809 )
    ( on b997 b242 )
    ( on b361 b997 )
    ( on b260 b361 )
    ( on b413 b260 )
    ( on b304 b413 )
    ( on b968 b304 )
    ( on b963 b968 )
    ( on b492 b963 )
    ( on b645 b492 )
    ( on b736 b645 )
    ( on b34 b736 )
    ( on b497 b34 )
    ( on b356 b497 )
    ( on b119 b356 )
    ( on b58 b119 )
    ( on b418 b58 )
    ( on b80 b418 )
    ( on b794 b80 )
    ( on b992 b794 )
    ( on b292 b992 )
    ( on b984 b292 )
    ( on b122 b984 )
    ( on b263 b122 )
    ( on b329 b263 )
    ( on b993 b329 )
    ( on b26 b993 )
    ( on b327 b26 )
    ( on b253 b327 )
    ( on b808 b253 )
    ( clear b808 )
  )
  ( :goal
    ( and
      ( clear b709 )
    )
  )
)
