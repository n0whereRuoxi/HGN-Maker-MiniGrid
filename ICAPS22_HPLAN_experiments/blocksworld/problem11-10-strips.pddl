( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b922 - block
    b700 - block
    b926 - block
    b208 - block
    b484 - block
    b426 - block
    b758 - block
    b35 - block
    b699 - block
    b181 - block
    b834 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b922 )
    ( on b700 b922 )
    ( on b926 b700 )
    ( on b208 b926 )
    ( on b484 b208 )
    ( on b426 b484 )
    ( on b758 b426 )
    ( on b35 b758 )
    ( on b699 b35 )
    ( on b181 b699 )
    ( on b834 b181 )
    ( on b136 b834 )
    ( clear b136 )
  )
  ( :goal
    ( and
      ( clear b922 )
    )
  )
)
