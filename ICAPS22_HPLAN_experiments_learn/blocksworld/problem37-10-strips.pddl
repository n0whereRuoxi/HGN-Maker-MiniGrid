( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b646 - block
    b813 - block
    b696 - block
    b173 - block
    b655 - block
    b734 - block
    b889 - block
    b432 - block
    b385 - block
    b833 - block
    b999 - block
    b596 - block
    b396 - block
    b344 - block
    b839 - block
    b390 - block
    b318 - block
    b24 - block
    b991 - block
    b798 - block
    b431 - block
    b651 - block
    b50 - block
    b471 - block
    b845 - block
    b97 - block
    b586 - block
    b259 - block
    b80 - block
    b411 - block
    b302 - block
    b287 - block
    b860 - block
    b728 - block
    b372 - block
    b631 - block
    b956 - block
    b593 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b646 )
    ( on b813 b646 )
    ( on b696 b813 )
    ( on b173 b696 )
    ( on b655 b173 )
    ( on b734 b655 )
    ( on b889 b734 )
    ( on b432 b889 )
    ( on b385 b432 )
    ( on b833 b385 )
    ( on b999 b833 )
    ( on b596 b999 )
    ( on b396 b596 )
    ( on b344 b396 )
    ( on b839 b344 )
    ( on b390 b839 )
    ( on b318 b390 )
    ( on b24 b318 )
    ( on b991 b24 )
    ( on b798 b991 )
    ( on b431 b798 )
    ( on b651 b431 )
    ( on b50 b651 )
    ( on b471 b50 )
    ( on b845 b471 )
    ( on b97 b845 )
    ( on b586 b97 )
    ( on b259 b586 )
    ( on b80 b259 )
    ( on b411 b80 )
    ( on b302 b411 )
    ( on b287 b302 )
    ( on b860 b287 )
    ( on b728 b860 )
    ( on b372 b728 )
    ( on b631 b372 )
    ( on b956 b631 )
    ( on b593 b956 )
    ( clear b593 )
  )
  ( :goal
    ( and
      ( clear b646 )
    )
  )
)
