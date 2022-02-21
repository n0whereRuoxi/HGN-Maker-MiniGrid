( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b253 - block
    b893 - block
    b760 - block
    b131 - block
    b984 - block
    b386 - block
    b658 - block
    b390 - block
    b998 - block
    b786 - block
    b872 - block
    b985 - block
    b223 - block
    b322 - block
    b429 - block
    b384 - block
    b488 - block
    b684 - block
    b156 - block
    b383 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b893 b253 )
    ( on b760 b893 )
    ( on b131 b760 )
    ( on b984 b131 )
    ( on b386 b984 )
    ( on b658 b386 )
    ( on b390 b658 )
    ( on b998 b390 )
    ( on b786 b998 )
    ( on b872 b786 )
    ( on b985 b872 )
    ( on b223 b985 )
    ( on b322 b223 )
    ( on b429 b322 )
    ( on b384 b429 )
    ( on b488 b384 )
    ( on b684 b488 )
    ( on b156 b684 )
    ( on b383 b156 )
    ( clear b383 )
  )
  ( :goal
    ( and
      ( clear b253 )
    )
  )
)
