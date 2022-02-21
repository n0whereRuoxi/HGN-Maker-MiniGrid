( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b893 - block
    b563 - block
    b245 - block
    b243 - block
    b98 - block
    b449 - block
    b335 - block
    b570 - block
    b759 - block
    b199 - block
    b387 - block
    b229 - block
    b413 - block
    b655 - block
    b966 - block
    b716 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b893 b965 )
    ( on b563 b893 )
    ( on b245 b563 )
    ( on b243 b245 )
    ( on b98 b243 )
    ( on b449 b98 )
    ( on b335 b449 )
    ( on b570 b335 )
    ( on b759 b570 )
    ( on b199 b759 )
    ( on b387 b199 )
    ( on b229 b387 )
    ( on b413 b229 )
    ( on b655 b413 )
    ( on b966 b655 )
    ( on b716 b966 )
    ( clear b716 )
  )
  ( :goal
    ( and
      ( clear b965 )
    )
  )
)
