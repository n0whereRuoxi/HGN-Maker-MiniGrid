( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b923 - block
    b736 - block
    b657 - block
    b750 - block
    b660 - block
    b259 - block
    b833 - block
    b613 - block
    b355 - block
    b431 - block
    b594 - block
    b711 - block
    b909 - block
    b551 - block
    b475 - block
    b692 - block
    b111 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b923 )
    ( on b736 b923 )
    ( on b657 b736 )
    ( on b750 b657 )
    ( on b660 b750 )
    ( on b259 b660 )
    ( on b833 b259 )
    ( on b613 b833 )
    ( on b355 b613 )
    ( on b431 b355 )
    ( on b594 b431 )
    ( on b711 b594 )
    ( on b909 b711 )
    ( on b551 b909 )
    ( on b475 b551 )
    ( on b692 b475 )
    ( on b111 b692 )
    ( clear b111 )
  )
  ( :goal
    ( and
      ( clear b923 )
    )
  )
)
