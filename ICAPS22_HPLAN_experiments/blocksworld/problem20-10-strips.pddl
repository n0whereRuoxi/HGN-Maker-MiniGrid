( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b317 - block
    b417 - block
    b419 - block
    b194 - block
    b371 - block
    b862 - block
    b827 - block
    b855 - block
    b163 - block
    b565 - block
    b699 - block
    b586 - block
    b301 - block
    b14 - block
    b526 - block
    b832 - block
    b575 - block
    b694 - block
    b138 - block
    b364 - block
    b219 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b317 )
    ( on b417 b317 )
    ( on b419 b417 )
    ( on b194 b419 )
    ( on b371 b194 )
    ( on b862 b371 )
    ( on b827 b862 )
    ( on b855 b827 )
    ( on b163 b855 )
    ( on b565 b163 )
    ( on b699 b565 )
    ( on b586 b699 )
    ( on b301 b586 )
    ( on b14 b301 )
    ( on b526 b14 )
    ( on b832 b526 )
    ( on b575 b832 )
    ( on b694 b575 )
    ( on b138 b694 )
    ( on b364 b138 )
    ( on b219 b364 )
    ( clear b219 )
  )
  ( :goal
    ( and
      ( clear b317 )
    )
  )
)
