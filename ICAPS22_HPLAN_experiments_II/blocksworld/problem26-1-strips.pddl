( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b516 - block
    b523 - block
    b91 - block
    b600 - block
    b219 - block
    b544 - block
    b374 - block
    b75 - block
    b725 - block
    b103 - block
    b308 - block
    b658 - block
    b124 - block
    b239 - block
    b396 - block
    b614 - block
    b60 - block
    b112 - block
    b503 - block
    b334 - block
    b167 - block
    b798 - block
    b891 - block
    b916 - block
    b123 - block
    b662 - block
    b130 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b516 )
    ( on b523 b516 )
    ( on b91 b523 )
    ( on b600 b91 )
    ( on b219 b600 )
    ( on b544 b219 )
    ( on b374 b544 )
    ( on b75 b374 )
    ( on b725 b75 )
    ( on b103 b725 )
    ( on b308 b103 )
    ( on b658 b308 )
    ( on b124 b658 )
    ( on b239 b124 )
    ( on b396 b239 )
    ( on b614 b396 )
    ( on b60 b614 )
    ( on b112 b60 )
    ( on b503 b112 )
    ( on b334 b503 )
    ( on b167 b334 )
    ( on b798 b167 )
    ( on b891 b798 )
    ( on b916 b891 )
    ( on b123 b916 )
    ( on b662 b123 )
    ( on b130 b662 )
    ( clear b130 )
  )
  ( :goal
    ( and
      ( clear b516 )
    )
  )
)
