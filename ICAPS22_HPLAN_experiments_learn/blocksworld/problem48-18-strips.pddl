( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b301 - block
    b634 - block
    b977 - block
    b99 - block
    b945 - block
    b28 - block
    b211 - block
    b142 - block
    b832 - block
    b385 - block
    b707 - block
    b34 - block
    b198 - block
    b477 - block
    b551 - block
    b375 - block
    b471 - block
    b694 - block
    b123 - block
    b679 - block
    b180 - block
    b169 - block
    b508 - block
    b129 - block
    b594 - block
    b371 - block
    b959 - block
    b281 - block
    b835 - block
    b717 - block
    b376 - block
    b596 - block
    b349 - block
    b139 - block
    b418 - block
    b671 - block
    b260 - block
    b146 - block
    b928 - block
    b921 - block
    b457 - block
    b322 - block
    b358 - block
    b165 - block
    b555 - block
    b362 - block
    b94 - block
    b895 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b301 )
    ( on b634 b301 )
    ( on b977 b634 )
    ( on b99 b977 )
    ( on b945 b99 )
    ( on b28 b945 )
    ( on b211 b28 )
    ( on b142 b211 )
    ( on b832 b142 )
    ( on b385 b832 )
    ( on b707 b385 )
    ( on b34 b707 )
    ( on b198 b34 )
    ( on b477 b198 )
    ( on b551 b477 )
    ( on b375 b551 )
    ( on b471 b375 )
    ( on b694 b471 )
    ( on b123 b694 )
    ( on b679 b123 )
    ( on b180 b679 )
    ( on b169 b180 )
    ( on b508 b169 )
    ( on b129 b508 )
    ( on b594 b129 )
    ( on b371 b594 )
    ( on b959 b371 )
    ( on b281 b959 )
    ( on b835 b281 )
    ( on b717 b835 )
    ( on b376 b717 )
    ( on b596 b376 )
    ( on b349 b596 )
    ( on b139 b349 )
    ( on b418 b139 )
    ( on b671 b418 )
    ( on b260 b671 )
    ( on b146 b260 )
    ( on b928 b146 )
    ( on b921 b928 )
    ( on b457 b921 )
    ( on b322 b457 )
    ( on b358 b322 )
    ( on b165 b358 )
    ( on b555 b165 )
    ( on b362 b555 )
    ( on b94 b362 )
    ( on b895 b94 )
    ( on b839 b895 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b301 )
    )
  )
)
