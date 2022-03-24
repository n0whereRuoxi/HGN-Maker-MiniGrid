( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b496 - block
    b165 - block
    b692 - block
    b971 - block
    b516 - block
    b916 - block
    b332 - block
    b61 - block
    b144 - block
    b970 - block
    b403 - block
    b730 - block
    b494 - block
    b670 - block
    b275 - block
    b300 - block
    b898 - block
    b109 - block
    b729 - block
    b268 - block
    b455 - block
    b169 - block
    b170 - block
    b96 - block
    b76 - block
    b399 - block
    b827 - block
    b838 - block
    b381 - block
    b537 - block
    b23 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b496 )
    ( on b165 b496 )
    ( on b692 b165 )
    ( on b971 b692 )
    ( on b516 b971 )
    ( on b916 b516 )
    ( on b332 b916 )
    ( on b61 b332 )
    ( on b144 b61 )
    ( on b970 b144 )
    ( on b403 b970 )
    ( on b730 b403 )
    ( on b494 b730 )
    ( on b670 b494 )
    ( on b275 b670 )
    ( on b300 b275 )
    ( on b898 b300 )
    ( on b109 b898 )
    ( on b729 b109 )
    ( on b268 b729 )
    ( on b455 b268 )
    ( on b169 b455 )
    ( on b170 b169 )
    ( on b96 b170 )
    ( on b76 b96 )
    ( on b399 b76 )
    ( on b827 b399 )
    ( on b838 b827 )
    ( on b381 b838 )
    ( on b537 b381 )
    ( on b23 b537 )
    ( clear b23 )
  )
  ( :tasks
    ( Make-30Pile b165 b692 b971 b516 b916 b332 b61 b144 b970 b403 b730 b494 b670 b275 b300 b898 b109 b729 b268 b455 b169 b170 b96 b76 b399 b827 b838 b381 b537 b23 )
  )
)
