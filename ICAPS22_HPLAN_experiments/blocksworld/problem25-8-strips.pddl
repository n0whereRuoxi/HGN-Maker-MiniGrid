( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b819 - block
    b711 - block
    b604 - block
    b87 - block
    b906 - block
    b671 - block
    b173 - block
    b643 - block
    b568 - block
    b850 - block
    b644 - block
    b845 - block
    b803 - block
    b406 - block
    b469 - block
    b130 - block
    b224 - block
    b278 - block
    b951 - block
    b132 - block
    b858 - block
    b660 - block
    b386 - block
    b310 - block
    b219 - block
    b567 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b819 )
    ( on b711 b819 )
    ( on b604 b711 )
    ( on b87 b604 )
    ( on b906 b87 )
    ( on b671 b906 )
    ( on b173 b671 )
    ( on b643 b173 )
    ( on b568 b643 )
    ( on b850 b568 )
    ( on b644 b850 )
    ( on b845 b644 )
    ( on b803 b845 )
    ( on b406 b803 )
    ( on b469 b406 )
    ( on b130 b469 )
    ( on b224 b130 )
    ( on b278 b224 )
    ( on b951 b278 )
    ( on b132 b951 )
    ( on b858 b132 )
    ( on b660 b858 )
    ( on b386 b660 )
    ( on b310 b386 )
    ( on b219 b310 )
    ( on b567 b219 )
    ( clear b567 )
  )
  ( :goal
    ( and
      ( clear b819 )
    )
  )
)
