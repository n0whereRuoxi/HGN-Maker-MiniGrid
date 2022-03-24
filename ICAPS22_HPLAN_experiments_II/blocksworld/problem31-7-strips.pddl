( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b869 - block
    b76 - block
    b991 - block
    b251 - block
    b696 - block
    b884 - block
    b861 - block
    b902 - block
    b541 - block
    b358 - block
    b603 - block
    b219 - block
    b492 - block
    b982 - block
    b819 - block
    b739 - block
    b526 - block
    b471 - block
    b380 - block
    b77 - block
    b364 - block
    b255 - block
    b735 - block
    b607 - block
    b47 - block
    b158 - block
    b485 - block
    b528 - block
    b977 - block
    b249 - block
    b462 - block
    b571 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b869 )
    ( on b76 b869 )
    ( on b991 b76 )
    ( on b251 b991 )
    ( on b696 b251 )
    ( on b884 b696 )
    ( on b861 b884 )
    ( on b902 b861 )
    ( on b541 b902 )
    ( on b358 b541 )
    ( on b603 b358 )
    ( on b219 b603 )
    ( on b492 b219 )
    ( on b982 b492 )
    ( on b819 b982 )
    ( on b739 b819 )
    ( on b526 b739 )
    ( on b471 b526 )
    ( on b380 b471 )
    ( on b77 b380 )
    ( on b364 b77 )
    ( on b255 b364 )
    ( on b735 b255 )
    ( on b607 b735 )
    ( on b47 b607 )
    ( on b158 b47 )
    ( on b485 b158 )
    ( on b528 b485 )
    ( on b977 b528 )
    ( on b249 b977 )
    ( on b462 b249 )
    ( on b571 b462 )
    ( clear b571 )
  )
  ( :goal
    ( and
      ( clear b869 )
    )
  )
)
