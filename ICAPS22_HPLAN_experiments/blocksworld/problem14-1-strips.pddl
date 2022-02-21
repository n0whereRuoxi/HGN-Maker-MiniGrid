( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b210 - block
    b437 - block
    b530 - block
    b624 - block
    b922 - block
    b164 - block
    b893 - block
    b46 - block
    b183 - block
    b711 - block
    b916 - block
    b521 - block
    b335 - block
    b669 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b210 )
    ( on b437 b210 )
    ( on b530 b437 )
    ( on b624 b530 )
    ( on b922 b624 )
    ( on b164 b922 )
    ( on b893 b164 )
    ( on b46 b893 )
    ( on b183 b46 )
    ( on b711 b183 )
    ( on b916 b711 )
    ( on b521 b916 )
    ( on b335 b521 )
    ( on b669 b335 )
    ( on b21 b669 )
    ( clear b21 )
  )
  ( :goal
    ( and
      ( clear b210 )
    )
  )
)
