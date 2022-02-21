( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b899 - block
    b690 - block
    b219 - block
    b704 - block
    b390 - block
    b270 - block
    b598 - block
    b659 - block
    b544 - block
    b377 - block
    b832 - block
    b409 - block
    b430 - block
    b159 - block
    b648 - block
    b781 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b899 )
    ( on b690 b899 )
    ( on b219 b690 )
    ( on b704 b219 )
    ( on b390 b704 )
    ( on b270 b390 )
    ( on b598 b270 )
    ( on b659 b598 )
    ( on b544 b659 )
    ( on b377 b544 )
    ( on b832 b377 )
    ( on b409 b832 )
    ( on b430 b409 )
    ( on b159 b430 )
    ( on b648 b159 )
    ( on b781 b648 )
    ( clear b781 )
  )
  ( :goal
    ( and
      ( clear b899 )
    )
  )
)
