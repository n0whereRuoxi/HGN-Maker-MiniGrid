( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b102 - block
    b160 - block
    b265 - block
    b839 - block
    b547 - block
    b995 - block
    b436 - block
    b874 - block
    b304 - block
    b144 - block
    b416 - block
    b599 - block
    b544 - block
    b194 - block
    b676 - block
    b588 - block
    b37 - block
    b341 - block
    b21 - block
    b861 - block
    b359 - block
    b552 - block
    b2 - block
    b534 - block
    b753 - block
    b292 - block
    b125 - block
    b903 - block
    b725 - block
    b465 - block
    b845 - block
    b107 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b102 )
    ( on b160 b102 )
    ( on b265 b160 )
    ( on b839 b265 )
    ( on b547 b839 )
    ( on b995 b547 )
    ( on b436 b995 )
    ( on b874 b436 )
    ( on b304 b874 )
    ( on b144 b304 )
    ( on b416 b144 )
    ( on b599 b416 )
    ( on b544 b599 )
    ( on b194 b544 )
    ( on b676 b194 )
    ( on b588 b676 )
    ( on b37 b588 )
    ( on b341 b37 )
    ( on b21 b341 )
    ( on b861 b21 )
    ( on b359 b861 )
    ( on b552 b359 )
    ( on b2 b552 )
    ( on b534 b2 )
    ( on b753 b534 )
    ( on b292 b753 )
    ( on b125 b292 )
    ( on b903 b125 )
    ( on b725 b903 )
    ( on b465 b725 )
    ( on b845 b465 )
    ( on b107 b845 )
    ( clear b107 )
  )
  ( :goal
    ( and
      ( clear b102 )
    )
  )
)
