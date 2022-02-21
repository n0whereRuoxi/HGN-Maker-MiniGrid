( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b129 - block
    b599 - block
    b855 - block
    b614 - block
    b836 - block
    b89 - block
    b898 - block
    b287 - block
    b234 - block
    b735 - block
    b113 - block
    b615 - block
    b371 - block
    b868 - block
    b963 - block
    b207 - block
    b62 - block
    b291 - block
    b550 - block
    b497 - block
    b743 - block
    b187 - block
    b195 - block
    b507 - block
    b584 - block
    b696 - block
    b896 - block
    b46 - block
    b494 - block
    b671 - block
    b929 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b129 )
    ( on b599 b129 )
    ( on b855 b599 )
    ( on b614 b855 )
    ( on b836 b614 )
    ( on b89 b836 )
    ( on b898 b89 )
    ( on b287 b898 )
    ( on b234 b287 )
    ( on b735 b234 )
    ( on b113 b735 )
    ( on b615 b113 )
    ( on b371 b615 )
    ( on b868 b371 )
    ( on b963 b868 )
    ( on b207 b963 )
    ( on b62 b207 )
    ( on b291 b62 )
    ( on b550 b291 )
    ( on b497 b550 )
    ( on b743 b497 )
    ( on b187 b743 )
    ( on b195 b187 )
    ( on b507 b195 )
    ( on b584 b507 )
    ( on b696 b584 )
    ( on b896 b696 )
    ( on b46 b896 )
    ( on b494 b46 )
    ( on b671 b494 )
    ( on b929 b671 )
    ( on b612 b929 )
    ( clear b612 )
  )
  ( :goal
    ( and
      ( clear b129 )
    )
  )
)
