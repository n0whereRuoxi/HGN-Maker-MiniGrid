( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b361 - block
    b396 - block
    b286 - block
    b558 - block
    b776 - block
    b323 - block
    b419 - block
    b170 - block
    b53 - block
    b796 - block
    b943 - block
    b570 - block
    b698 - block
    b724 - block
    b914 - block
    b199 - block
    b765 - block
    b14 - block
    b484 - block
    b40 - block
    b31 - block
    b110 - block
    b225 - block
    b428 - block
    b148 - block
    b941 - block
    b585 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b361 )
    ( on b396 b361 )
    ( on b286 b396 )
    ( on b558 b286 )
    ( on b776 b558 )
    ( on b323 b776 )
    ( on b419 b323 )
    ( on b170 b419 )
    ( on b53 b170 )
    ( on b796 b53 )
    ( on b943 b796 )
    ( on b570 b943 )
    ( on b698 b570 )
    ( on b724 b698 )
    ( on b914 b724 )
    ( on b199 b914 )
    ( on b765 b199 )
    ( on b14 b765 )
    ( on b484 b14 )
    ( on b40 b484 )
    ( on b31 b40 )
    ( on b110 b31 )
    ( on b225 b110 )
    ( on b428 b225 )
    ( on b148 b428 )
    ( on b941 b148 )
    ( on b585 b941 )
    ( on b356 b585 )
    ( clear b356 )
  )
  ( :goal
    ( and
      ( clear b361 )
    )
  )
)
