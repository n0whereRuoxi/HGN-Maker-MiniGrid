( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b921 - block
    b632 - block
    b7 - block
    b146 - block
    b908 - block
    b929 - block
    b129 - block
    b548 - block
    b774 - block
    b739 - block
    b763 - block
    b614 - block
    b505 - block
    b631 - block
    b663 - block
    b530 - block
    b49 - block
    b735 - block
    b596 - block
    b884 - block
    b974 - block
    b712 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b921 )
    ( on b632 b921 )
    ( on b7 b632 )
    ( on b146 b7 )
    ( on b908 b146 )
    ( on b929 b908 )
    ( on b129 b929 )
    ( on b548 b129 )
    ( on b774 b548 )
    ( on b739 b774 )
    ( on b763 b739 )
    ( on b614 b763 )
    ( on b505 b614 )
    ( on b631 b505 )
    ( on b663 b631 )
    ( on b530 b663 )
    ( on b49 b530 )
    ( on b735 b49 )
    ( on b596 b735 )
    ( on b884 b596 )
    ( on b974 b884 )
    ( on b712 b974 )
    ( clear b712 )
  )
  ( :goal
    ( and
      ( clear b921 )
    )
  )
)
