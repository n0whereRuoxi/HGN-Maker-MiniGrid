( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b106 - block
    b155 - block
    b983 - block
    b632 - block
    b565 - block
    b627 - block
    b712 - block
    b68 - block
    b47 - block
    b159 - block
    b680 - block
    b297 - block
    b584 - block
    b526 - block
    b826 - block
    b969 - block
    b218 - block
    b648 - block
    b540 - block
    b710 - block
    b624 - block
    b987 - block
    b349 - block
    b180 - block
    b147 - block
    b676 - block
    b661 - block
    b605 - block
    b977 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b106 )
    ( on b155 b106 )
    ( on b983 b155 )
    ( on b632 b983 )
    ( on b565 b632 )
    ( on b627 b565 )
    ( on b712 b627 )
    ( on b68 b712 )
    ( on b47 b68 )
    ( on b159 b47 )
    ( on b680 b159 )
    ( on b297 b680 )
    ( on b584 b297 )
    ( on b526 b584 )
    ( on b826 b526 )
    ( on b969 b826 )
    ( on b218 b969 )
    ( on b648 b218 )
    ( on b540 b648 )
    ( on b710 b540 )
    ( on b624 b710 )
    ( on b987 b624 )
    ( on b349 b987 )
    ( on b180 b349 )
    ( on b147 b180 )
    ( on b676 b147 )
    ( on b661 b676 )
    ( on b605 b661 )
    ( on b977 b605 )
    ( clear b977 )
  )
  ( :goal
    ( and
      ( clear b106 )
    )
  )
)
