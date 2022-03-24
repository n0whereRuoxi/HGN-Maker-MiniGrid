( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b261 - block
    b480 - block
    b770 - block
    b692 - block
    b871 - block
    b968 - block
    b501 - block
    b124 - block
    b385 - block
    b210 - block
    b355 - block
    b994 - block
    b711 - block
    b89 - block
    b614 - block
    b639 - block
    b587 - block
    b881 - block
    b703 - block
    b950 - block
    b974 - block
    b68 - block
    b598 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b261 )
    ( on b480 b261 )
    ( on b770 b480 )
    ( on b692 b770 )
    ( on b871 b692 )
    ( on b968 b871 )
    ( on b501 b968 )
    ( on b124 b501 )
    ( on b385 b124 )
    ( on b210 b385 )
    ( on b355 b210 )
    ( on b994 b355 )
    ( on b711 b994 )
    ( on b89 b711 )
    ( on b614 b89 )
    ( on b639 b614 )
    ( on b587 b639 )
    ( on b881 b587 )
    ( on b703 b881 )
    ( on b950 b703 )
    ( on b974 b950 )
    ( on b68 b974 )
    ( on b598 b68 )
    ( clear b598 )
  )
  ( :goal
    ( and
      ( clear b261 )
    )
  )
)
