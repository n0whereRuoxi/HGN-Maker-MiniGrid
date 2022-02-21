( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b826 - block
    b445 - block
    b374 - block
    b160 - block
    b535 - block
    b805 - block
    b292 - block
    b330 - block
    b12 - block
    b852 - block
    b329 - block
    b748 - block
    b116 - block
    b646 - block
    b601 - block
    b851 - block
    b548 - block
    b577 - block
    b661 - block
    b392 - block
    b4 - block
    b941 - block
    b264 - block
    b918 - block
    b798 - block
    b5 - block
    b379 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b826 )
    ( on b445 b826 )
    ( on b374 b445 )
    ( on b160 b374 )
    ( on b535 b160 )
    ( on b805 b535 )
    ( on b292 b805 )
    ( on b330 b292 )
    ( on b12 b330 )
    ( on b852 b12 )
    ( on b329 b852 )
    ( on b748 b329 )
    ( on b116 b748 )
    ( on b646 b116 )
    ( on b601 b646 )
    ( on b851 b601 )
    ( on b548 b851 )
    ( on b577 b548 )
    ( on b661 b577 )
    ( on b392 b661 )
    ( on b4 b392 )
    ( on b941 b4 )
    ( on b264 b941 )
    ( on b918 b264 )
    ( on b798 b918 )
    ( on b5 b798 )
    ( on b379 b5 )
    ( clear b379 )
  )
  ( :goal
    ( and
      ( clear b826 )
    )
  )
)
