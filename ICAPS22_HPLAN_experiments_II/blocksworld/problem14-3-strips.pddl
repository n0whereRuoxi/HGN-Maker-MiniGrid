( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b682 - block
    b664 - block
    b165 - block
    b201 - block
    b443 - block
    b354 - block
    b182 - block
    b31 - block
    b886 - block
    b544 - block
    b991 - block
    b697 - block
    b540 - block
    b977 - block
    b810 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b682 )
    ( on b664 b682 )
    ( on b165 b664 )
    ( on b201 b165 )
    ( on b443 b201 )
    ( on b354 b443 )
    ( on b182 b354 )
    ( on b31 b182 )
    ( on b886 b31 )
    ( on b544 b886 )
    ( on b991 b544 )
    ( on b697 b991 )
    ( on b540 b697 )
    ( on b977 b540 )
    ( on b810 b977 )
    ( clear b810 )
  )
  ( :goal
    ( and
      ( clear b682 )
    )
  )
)
