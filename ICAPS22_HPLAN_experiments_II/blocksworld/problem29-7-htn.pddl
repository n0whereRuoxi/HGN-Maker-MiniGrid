( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b950 - block
    b272 - block
    b853 - block
    b306 - block
    b578 - block
    b256 - block
    b416 - block
    b949 - block
    b604 - block
    b157 - block
    b102 - block
    b259 - block
    b266 - block
    b700 - block
    b691 - block
    b396 - block
    b574 - block
    b613 - block
    b947 - block
    b24 - block
    b800 - block
    b116 - block
    b206 - block
    b634 - block
    b698 - block
    b250 - block
    b167 - block
    b655 - block
    b731 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b950 b91 )
    ( on b272 b950 )
    ( on b853 b272 )
    ( on b306 b853 )
    ( on b578 b306 )
    ( on b256 b578 )
    ( on b416 b256 )
    ( on b949 b416 )
    ( on b604 b949 )
    ( on b157 b604 )
    ( on b102 b157 )
    ( on b259 b102 )
    ( on b266 b259 )
    ( on b700 b266 )
    ( on b691 b700 )
    ( on b396 b691 )
    ( on b574 b396 )
    ( on b613 b574 )
    ( on b947 b613 )
    ( on b24 b947 )
    ( on b800 b24 )
    ( on b116 b800 )
    ( on b206 b116 )
    ( on b634 b206 )
    ( on b698 b634 )
    ( on b250 b698 )
    ( on b167 b250 )
    ( on b655 b167 )
    ( on b731 b655 )
    ( clear b731 )
  )
  ( :tasks
    ( Make-29Pile b950 b272 b853 b306 b578 b256 b416 b949 b604 b157 b102 b259 b266 b700 b691 b396 b574 b613 b947 b24 b800 b116 b206 b634 b698 b250 b167 b655 b731 )
  )
)
