( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b738 - block
    b983 - block
    b48 - block
    b932 - block
    b543 - block
    b951 - block
    b105 - block
    b203 - block
    b311 - block
    b265 - block
    b258 - block
    b979 - block
    b7 - block
    b88 - block
    b559 - block
    b583 - block
    b115 - block
    b976 - block
    b627 - block
    b760 - block
    b441 - block
    b609 - block
    b922 - block
    b89 - block
    b154 - block
    b506 - block
    b445 - block
    b169 - block
    b743 - block
    b399 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b738 )
    ( on b983 b738 )
    ( on b48 b983 )
    ( on b932 b48 )
    ( on b543 b932 )
    ( on b951 b543 )
    ( on b105 b951 )
    ( on b203 b105 )
    ( on b311 b203 )
    ( on b265 b311 )
    ( on b258 b265 )
    ( on b979 b258 )
    ( on b7 b979 )
    ( on b88 b7 )
    ( on b559 b88 )
    ( on b583 b559 )
    ( on b115 b583 )
    ( on b976 b115 )
    ( on b627 b976 )
    ( on b760 b627 )
    ( on b441 b760 )
    ( on b609 b441 )
    ( on b922 b609 )
    ( on b89 b922 )
    ( on b154 b89 )
    ( on b506 b154 )
    ( on b445 b506 )
    ( on b169 b445 )
    ( on b743 b169 )
    ( on b399 b743 )
    ( clear b399 )
  )
  ( :goal
    ( and
      ( clear b738 )
    )
  )
)
