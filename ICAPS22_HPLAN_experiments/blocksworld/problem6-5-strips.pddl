( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b704 - block
    b495 - block
    b430 - block
    b292 - block
    b656 - block
    b896 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b704 b339 )
    ( on b495 b704 )
    ( on b430 b495 )
    ( on b292 b430 )
    ( on b656 b292 )
    ( on b896 b656 )
    ( clear b896 )
  )
  ( :goal
    ( and
      ( clear b339 )
      ( clear b339 )
      ( clear b339 )
      ( clear b339 )
      ( clear b339 )
      ( clear b339 )
      ( clear b339 )
    )
  )
)
