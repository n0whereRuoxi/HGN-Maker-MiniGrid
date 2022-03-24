( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b132 - block
    b435 - block
    b130 - block
    b259 - block
    b597 - block
    b371 - block
    b453 - block
    b717 - block
    b403 - block
    b87 - block
    b665 - block
    b492 - block
    b894 - block
    b810 - block
    b606 - block
    b320 - block
    b447 - block
    b76 - block
    b383 - block
    b319 - block
    b31 - block
    b828 - block
    b170 - block
    b308 - block
    b215 - block
    b306 - block
    b794 - block
    b64 - block
    b244 - block
    b982 - block
    b596 - block
    b718 - block
    b52 - block
    b318 - block
    b660 - block
    b908 - block
    b772 - block
    b172 - block
    b22 - block
    b792 - block
    b960 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b132 )
    ( on b435 b132 )
    ( on b130 b435 )
    ( on b259 b130 )
    ( on b597 b259 )
    ( on b371 b597 )
    ( on b453 b371 )
    ( on b717 b453 )
    ( on b403 b717 )
    ( on b87 b403 )
    ( on b665 b87 )
    ( on b492 b665 )
    ( on b894 b492 )
    ( on b810 b894 )
    ( on b606 b810 )
    ( on b320 b606 )
    ( on b447 b320 )
    ( on b76 b447 )
    ( on b383 b76 )
    ( on b319 b383 )
    ( on b31 b319 )
    ( on b828 b31 )
    ( on b170 b828 )
    ( on b308 b170 )
    ( on b215 b308 )
    ( on b306 b215 )
    ( on b794 b306 )
    ( on b64 b794 )
    ( on b244 b64 )
    ( on b982 b244 )
    ( on b596 b982 )
    ( on b718 b596 )
    ( on b52 b718 )
    ( on b318 b52 )
    ( on b660 b318 )
    ( on b908 b660 )
    ( on b772 b908 )
    ( on b172 b772 )
    ( on b22 b172 )
    ( on b792 b22 )
    ( on b960 b792 )
    ( clear b960 )
  )
  ( :tasks
    ( Make-40Pile b435 b130 b259 b597 b371 b453 b717 b403 b87 b665 b492 b894 b810 b606 b320 b447 b76 b383 b319 b31 b828 b170 b308 b215 b306 b794 b64 b244 b982 b596 b718 b52 b318 b660 b908 b772 b172 b22 b792 b960 )
  )
)
