( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b553 - block
    b94 - block
    b549 - block
    b660 - block
    b751 - block
    b503 - block
    b484 - block
    b453 - block
    b850 - block
    b593 - block
    b594 - block
    b294 - block
    b903 - block
    b53 - block
    b663 - block
    b143 - block
    b251 - block
    b785 - block
    b444 - block
    b612 - block
    b288 - block
    b630 - block
    b85 - block
    b891 - block
    b131 - block
    b550 - block
    b912 - block
    b753 - block
    b551 - block
    b899 - block
    b832 - block
    b958 - block
    b875 - block
    b748 - block
    b401 - block
    b1 - block
    b635 - block
    b267 - block
    b182 - block
    b381 - block
    b460 - block
    b567 - block
    b740 - block
    b151 - block
    b95 - block
    b31 - block
    b369 - block
    b365 - block
    b172 - block
    b897 - block
    b301 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b553 )
    ( on b94 b553 )
    ( on b549 b94 )
    ( on b660 b549 )
    ( on b751 b660 )
    ( on b503 b751 )
    ( on b484 b503 )
    ( on b453 b484 )
    ( on b850 b453 )
    ( on b593 b850 )
    ( on b594 b593 )
    ( on b294 b594 )
    ( on b903 b294 )
    ( on b53 b903 )
    ( on b663 b53 )
    ( on b143 b663 )
    ( on b251 b143 )
    ( on b785 b251 )
    ( on b444 b785 )
    ( on b612 b444 )
    ( on b288 b612 )
    ( on b630 b288 )
    ( on b85 b630 )
    ( on b891 b85 )
    ( on b131 b891 )
    ( on b550 b131 )
    ( on b912 b550 )
    ( on b753 b912 )
    ( on b551 b753 )
    ( on b899 b551 )
    ( on b832 b899 )
    ( on b958 b832 )
    ( on b875 b958 )
    ( on b748 b875 )
    ( on b401 b748 )
    ( on b1 b401 )
    ( on b635 b1 )
    ( on b267 b635 )
    ( on b182 b267 )
    ( on b381 b182 )
    ( on b460 b381 )
    ( on b567 b460 )
    ( on b740 b567 )
    ( on b151 b740 )
    ( on b95 b151 )
    ( on b31 b95 )
    ( on b369 b31 )
    ( on b365 b369 )
    ( on b172 b365 )
    ( on b897 b172 )
    ( on b301 b897 )
    ( on b792 b301 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b553 )
    )
  )
)
