( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b710 - block
    b285 - block
    b588 - block
    b520 - block
    b163 - block
    b794 - block
    b411 - block
    b416 - block
    b117 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b710 )
    ( on b285 b710 )
    ( on b588 b285 )
    ( on b520 b588 )
    ( on b163 b520 )
    ( on b794 b163 )
    ( on b411 b794 )
    ( on b416 b411 )
    ( on b117 b416 )
    ( clear b117 )
  )
  ( :goal
    ( and
      ( clear b710 )
    )
  )
)
