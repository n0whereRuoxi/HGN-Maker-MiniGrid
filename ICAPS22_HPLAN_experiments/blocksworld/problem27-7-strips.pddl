( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b507 - block
    b323 - block
    b705 - block
    b834 - block
    b728 - block
    b96 - block
    b534 - block
    b585 - block
    b146 - block
    b572 - block
    b108 - block
    b885 - block
    b552 - block
    b659 - block
    b991 - block
    b102 - block
    b268 - block
    b920 - block
    b277 - block
    b801 - block
    b915 - block
    b475 - block
    b479 - block
    b252 - block
    b539 - block
    b133 - block
    b948 - block
    b490 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b507 )
    ( on b323 b507 )
    ( on b705 b323 )
    ( on b834 b705 )
    ( on b728 b834 )
    ( on b96 b728 )
    ( on b534 b96 )
    ( on b585 b534 )
    ( on b146 b585 )
    ( on b572 b146 )
    ( on b108 b572 )
    ( on b885 b108 )
    ( on b552 b885 )
    ( on b659 b552 )
    ( on b991 b659 )
    ( on b102 b991 )
    ( on b268 b102 )
    ( on b920 b268 )
    ( on b277 b920 )
    ( on b801 b277 )
    ( on b915 b801 )
    ( on b475 b915 )
    ( on b479 b475 )
    ( on b252 b479 )
    ( on b539 b252 )
    ( on b133 b539 )
    ( on b948 b133 )
    ( on b490 b948 )
    ( clear b490 )
  )
  ( :goal
    ( and
      ( clear b507 )
    )
  )
)
