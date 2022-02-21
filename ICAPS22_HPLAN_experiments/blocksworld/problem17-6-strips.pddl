( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b332 - block
    b693 - block
    b997 - block
    b144 - block
    b795 - block
    b915 - block
    b627 - block
    b648 - block
    b841 - block
    b45 - block
    b278 - block
    b87 - block
    b406 - block
    b499 - block
    b685 - block
    b946 - block
    b170 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b332 )
    ( on b693 b332 )
    ( on b997 b693 )
    ( on b144 b997 )
    ( on b795 b144 )
    ( on b915 b795 )
    ( on b627 b915 )
    ( on b648 b627 )
    ( on b841 b648 )
    ( on b45 b841 )
    ( on b278 b45 )
    ( on b87 b278 )
    ( on b406 b87 )
    ( on b499 b406 )
    ( on b685 b499 )
    ( on b946 b685 )
    ( on b170 b946 )
    ( on b366 b170 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b332 )
    )
  )
)
