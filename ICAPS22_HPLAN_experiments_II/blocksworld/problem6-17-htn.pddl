( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b318 - block
    b214 - block
    b670 - block
    b528 - block
    b711 - block
    b948 - block
    b156 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b318 )
    ( on b214 b318 )
    ( on b670 b214 )
    ( on b528 b670 )
    ( on b711 b528 )
    ( on b948 b711 )
    ( on b156 b948 )
    ( clear b156 )
  )
  ( :tasks
    ( Make-6Pile b214 b670 b528 b711 b948 b156 )
  )
)
