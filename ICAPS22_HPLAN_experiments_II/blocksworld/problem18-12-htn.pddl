( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b78 - block
    b331 - block
    b740 - block
    b263 - block
    b743 - block
    b586 - block
    b585 - block
    b349 - block
    b202 - block
    b559 - block
    b288 - block
    b531 - block
    b880 - block
    b112 - block
    b929 - block
    b786 - block
    b128 - block
    b899 - block
    b662 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b78 )
    ( on b331 b78 )
    ( on b740 b331 )
    ( on b263 b740 )
    ( on b743 b263 )
    ( on b586 b743 )
    ( on b585 b586 )
    ( on b349 b585 )
    ( on b202 b349 )
    ( on b559 b202 )
    ( on b288 b559 )
    ( on b531 b288 )
    ( on b880 b531 )
    ( on b112 b880 )
    ( on b929 b112 )
    ( on b786 b929 )
    ( on b128 b786 )
    ( on b899 b128 )
    ( on b662 b899 )
    ( clear b662 )
  )
  ( :tasks
    ( Make-18Pile b331 b740 b263 b743 b586 b585 b349 b202 b559 b288 b531 b880 b112 b929 b786 b128 b899 b662 )
  )
)
