( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b916 - block
    b744 - block
    b573 - block
    b835 - block
    b128 - block
    b752 - block
    b653 - block
    b866 - block
    b347 - block
    b141 - block
    b886 - block
    b705 - block
    b243 - block
    b93 - block
    b312 - block
    b253 - block
    b62 - block
    b30 - block
    b359 - block
    b460 - block
    b57 - block
    b396 - block
    b786 - block
    b153 - block
    b848 - block
    b83 - block
    b378 - block
    b218 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b916 )
    ( on b744 b916 )
    ( on b573 b744 )
    ( on b835 b573 )
    ( on b128 b835 )
    ( on b752 b128 )
    ( on b653 b752 )
    ( on b866 b653 )
    ( on b347 b866 )
    ( on b141 b347 )
    ( on b886 b141 )
    ( on b705 b886 )
    ( on b243 b705 )
    ( on b93 b243 )
    ( on b312 b93 )
    ( on b253 b312 )
    ( on b62 b253 )
    ( on b30 b62 )
    ( on b359 b30 )
    ( on b460 b359 )
    ( on b57 b460 )
    ( on b396 b57 )
    ( on b786 b396 )
    ( on b153 b786 )
    ( on b848 b153 )
    ( on b83 b848 )
    ( on b378 b83 )
    ( on b218 b378 )
    ( clear b218 )
  )
  ( :goal
    ( and
      ( clear b916 )
    )
  )
)
