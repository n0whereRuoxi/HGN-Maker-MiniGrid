( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b476 - block
    b757 - block
    b966 - block
    b172 - block
    b745 - block
    b898 - block
    b897 - block
    b683 - block
    b569 - block
    b565 - block
    b468 - block
    b235 - block
    b348 - block
    b804 - block
    b181 - block
    b376 - block
    b660 - block
    b698 - block
    b558 - block
    b410 - block
    b737 - block
    b535 - block
    b488 - block
    b873 - block
    b951 - block
    b385 - block
    b85 - block
    b189 - block
    b517 - block
    b574 - block
    b889 - block
    b319 - block
    b90 - block
    b471 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b476 )
    ( on b757 b476 )
    ( on b966 b757 )
    ( on b172 b966 )
    ( on b745 b172 )
    ( on b898 b745 )
    ( on b897 b898 )
    ( on b683 b897 )
    ( on b569 b683 )
    ( on b565 b569 )
    ( on b468 b565 )
    ( on b235 b468 )
    ( on b348 b235 )
    ( on b804 b348 )
    ( on b181 b804 )
    ( on b376 b181 )
    ( on b660 b376 )
    ( on b698 b660 )
    ( on b558 b698 )
    ( on b410 b558 )
    ( on b737 b410 )
    ( on b535 b737 )
    ( on b488 b535 )
    ( on b873 b488 )
    ( on b951 b873 )
    ( on b385 b951 )
    ( on b85 b385 )
    ( on b189 b85 )
    ( on b517 b189 )
    ( on b574 b517 )
    ( on b889 b574 )
    ( on b319 b889 )
    ( on b90 b319 )
    ( on b471 b90 )
    ( clear b471 )
  )
  ( :goal
    ( and
      ( clear b476 )
    )
  )
)
