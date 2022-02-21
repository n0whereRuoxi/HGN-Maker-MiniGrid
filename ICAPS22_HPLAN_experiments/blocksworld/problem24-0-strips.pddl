( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b228 - block
    b837 - block
    b589 - block
    b923 - block
    b534 - block
    b471 - block
    b720 - block
    b999 - block
    b601 - block
    b11 - block
    b816 - block
    b494 - block
    b135 - block
    b246 - block
    b150 - block
    b767 - block
    b805 - block
    b490 - block
    b158 - block
    b318 - block
    b532 - block
    b827 - block
    b441 - block
    b517 - block
    b373 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b228 )
    ( on b837 b228 )
    ( on b589 b837 )
    ( on b923 b589 )
    ( on b534 b923 )
    ( on b471 b534 )
    ( on b720 b471 )
    ( on b999 b720 )
    ( on b601 b999 )
    ( on b11 b601 )
    ( on b816 b11 )
    ( on b494 b816 )
    ( on b135 b494 )
    ( on b246 b135 )
    ( on b150 b246 )
    ( on b767 b150 )
    ( on b805 b767 )
    ( on b490 b805 )
    ( on b158 b490 )
    ( on b318 b158 )
    ( on b532 b318 )
    ( on b827 b532 )
    ( on b441 b827 )
    ( on b517 b441 )
    ( on b373 b517 )
    ( clear b373 )
  )
  ( :goal
    ( and
      ( clear b228 )
    )
  )
)
