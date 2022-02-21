( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b144 - block
    b427 - block
    b533 - block
    b962 - block
    b435 - block
    b667 - block
    b290 - block
    b810 - block
    b412 - block
    b57 - block
    b757 - block
    b917 - block
    b787 - block
    b839 - block
    b540 - block
    b614 - block
    b410 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b144 )
    ( on b427 b144 )
    ( on b533 b427 )
    ( on b962 b533 )
    ( on b435 b962 )
    ( on b667 b435 )
    ( on b290 b667 )
    ( on b810 b290 )
    ( on b412 b810 )
    ( on b57 b412 )
    ( on b757 b57 )
    ( on b917 b757 )
    ( on b787 b917 )
    ( on b839 b787 )
    ( on b540 b839 )
    ( on b614 b540 )
    ( on b410 b614 )
    ( clear b410 )
  )
  ( :goal
    ( and
      ( clear b144 )
    )
  )
)
