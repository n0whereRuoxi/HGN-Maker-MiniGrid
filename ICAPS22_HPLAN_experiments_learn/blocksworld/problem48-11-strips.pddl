( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b650 - block
    b829 - block
    b662 - block
    b244 - block
    b214 - block
    b299 - block
    b341 - block
    b830 - block
    b84 - block
    b185 - block
    b327 - block
    b512 - block
    b497 - block
    b254 - block
    b859 - block
    b822 - block
    b310 - block
    b475 - block
    b812 - block
    b55 - block
    b143 - block
    b926 - block
    b921 - block
    b336 - block
    b134 - block
    b802 - block
    b85 - block
    b939 - block
    b175 - block
    b359 - block
    b616 - block
    b473 - block
    b379 - block
    b785 - block
    b607 - block
    b918 - block
    b790 - block
    b864 - block
    b722 - block
    b368 - block
    b337 - block
    b183 - block
    b347 - block
    b162 - block
    b842 - block
    b481 - block
    b101 - block
    b23 - block
    b31 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b650 )
    ( on b829 b650 )
    ( on b662 b829 )
    ( on b244 b662 )
    ( on b214 b244 )
    ( on b299 b214 )
    ( on b341 b299 )
    ( on b830 b341 )
    ( on b84 b830 )
    ( on b185 b84 )
    ( on b327 b185 )
    ( on b512 b327 )
    ( on b497 b512 )
    ( on b254 b497 )
    ( on b859 b254 )
    ( on b822 b859 )
    ( on b310 b822 )
    ( on b475 b310 )
    ( on b812 b475 )
    ( on b55 b812 )
    ( on b143 b55 )
    ( on b926 b143 )
    ( on b921 b926 )
    ( on b336 b921 )
    ( on b134 b336 )
    ( on b802 b134 )
    ( on b85 b802 )
    ( on b939 b85 )
    ( on b175 b939 )
    ( on b359 b175 )
    ( on b616 b359 )
    ( on b473 b616 )
    ( on b379 b473 )
    ( on b785 b379 )
    ( on b607 b785 )
    ( on b918 b607 )
    ( on b790 b918 )
    ( on b864 b790 )
    ( on b722 b864 )
    ( on b368 b722 )
    ( on b337 b368 )
    ( on b183 b337 )
    ( on b347 b183 )
    ( on b162 b347 )
    ( on b842 b162 )
    ( on b481 b842 )
    ( on b101 b481 )
    ( on b23 b101 )
    ( on b31 b23 )
    ( clear b31 )
  )
  ( :goal
    ( and
      ( clear b650 )
    )
  )
)
