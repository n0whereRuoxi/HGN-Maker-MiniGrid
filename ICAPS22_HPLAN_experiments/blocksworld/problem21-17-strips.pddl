( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b46 - block
    b199 - block
    b605 - block
    b109 - block
    b773 - block
    b431 - block
    b607 - block
    b677 - block
    b749 - block
    b555 - block
    b710 - block
    b291 - block
    b759 - block
    b874 - block
    b440 - block
    b321 - block
    b672 - block
    b349 - block
    b956 - block
    b951 - block
    b734 - block
    b535 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b46 )
    ( on b199 b46 )
    ( on b605 b199 )
    ( on b109 b605 )
    ( on b773 b109 )
    ( on b431 b773 )
    ( on b607 b431 )
    ( on b677 b607 )
    ( on b749 b677 )
    ( on b555 b749 )
    ( on b710 b555 )
    ( on b291 b710 )
    ( on b759 b291 )
    ( on b874 b759 )
    ( on b440 b874 )
    ( on b321 b440 )
    ( on b672 b321 )
    ( on b349 b672 )
    ( on b956 b349 )
    ( on b951 b956 )
    ( on b734 b951 )
    ( on b535 b734 )
    ( clear b535 )
  )
  ( :goal
    ( and
      ( clear b46 )
    )
  )
)
