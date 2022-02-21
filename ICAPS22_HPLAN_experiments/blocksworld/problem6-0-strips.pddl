( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b324 - block
    b484 - block
    b383 - block
    b237 - block
    b393 - block
    b492 - block
    b577 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b324 )
    ( on b484 b324 )
    ( on b383 b484 )
    ( on b237 b383 )
    ( on b393 b237 )
    ( on b492 b393 )
    ( on b577 b492 )
    ( clear b577 )
  )
  ( :goal
    ( and
      ( clear b324 )
    )
  )
)
