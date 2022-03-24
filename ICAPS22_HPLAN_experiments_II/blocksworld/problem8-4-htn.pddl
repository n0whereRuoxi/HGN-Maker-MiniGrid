( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b931 - block
    b647 - block
    b755 - block
    b64 - block
    b465 - block
    b711 - block
    b785 - block
    b82 - block
    b314 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b931 )
    ( on b647 b931 )
    ( on b755 b647 )
    ( on b64 b755 )
    ( on b465 b64 )
    ( on b711 b465 )
    ( on b785 b711 )
    ( on b82 b785 )
    ( on b314 b82 )
    ( clear b314 )
  )
  ( :tasks
    ( Make-8Pile b647 b755 b64 b465 b711 b785 b82 b314 )
  )
)
