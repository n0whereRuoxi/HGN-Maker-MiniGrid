( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b598 - block
    b778 - block
    b192 - block
    b535 - block
    b178 - block
    b182 - block
    b671 - block
    b368 - block
    b847 - block
    b280 - block
    b653 - block
    b708 - block
    b675 - block
    b587 - block
    b801 - block
    b669 - block
    b314 - block
    b325 - block
    b984 - block
    b848 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b598 )
    ( on b778 b598 )
    ( on b192 b778 )
    ( on b535 b192 )
    ( on b178 b535 )
    ( on b182 b178 )
    ( on b671 b182 )
    ( on b368 b671 )
    ( on b847 b368 )
    ( on b280 b847 )
    ( on b653 b280 )
    ( on b708 b653 )
    ( on b675 b708 )
    ( on b587 b675 )
    ( on b801 b587 )
    ( on b669 b801 )
    ( on b314 b669 )
    ( on b325 b314 )
    ( on b984 b325 )
    ( on b848 b984 )
    ( clear b848 )
  )
  ( :goal
    ( and
      ( clear b598 )
    )
  )
)
