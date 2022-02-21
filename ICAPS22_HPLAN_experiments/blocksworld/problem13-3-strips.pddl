( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b381 - block
    b542 - block
    b632 - block
    b721 - block
    b193 - block
    b836 - block
    b749 - block
    b186 - block
    b338 - block
    b130 - block
    b59 - block
    b753 - block
    b849 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b381 )
    ( on b542 b381 )
    ( on b632 b542 )
    ( on b721 b632 )
    ( on b193 b721 )
    ( on b836 b193 )
    ( on b749 b836 )
    ( on b186 b749 )
    ( on b338 b186 )
    ( on b130 b338 )
    ( on b59 b130 )
    ( on b753 b59 )
    ( on b849 b753 )
    ( on b778 b849 )
    ( clear b778 )
  )
  ( :goal
    ( and
      ( clear b381 )
    )
  )
)
