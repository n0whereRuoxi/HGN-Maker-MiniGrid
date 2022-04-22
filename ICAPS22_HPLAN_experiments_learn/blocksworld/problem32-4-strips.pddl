( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b802 - block
    b192 - block
    b749 - block
    b186 - block
    b914 - block
    b876 - block
    b502 - block
    b287 - block
    b229 - block
    b410 - block
    b434 - block
    b142 - block
    b81 - block
    b488 - block
    b482 - block
    b15 - block
    b657 - block
    b443 - block
    b446 - block
    b747 - block
    b377 - block
    b44 - block
    b883 - block
    b675 - block
    b764 - block
    b661 - block
    b292 - block
    b827 - block
    b732 - block
    b120 - block
    b536 - block
    b72 - block
    b565 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b802 )
    ( on b192 b802 )
    ( on b749 b192 )
    ( on b186 b749 )
    ( on b914 b186 )
    ( on b876 b914 )
    ( on b502 b876 )
    ( on b287 b502 )
    ( on b229 b287 )
    ( on b410 b229 )
    ( on b434 b410 )
    ( on b142 b434 )
    ( on b81 b142 )
    ( on b488 b81 )
    ( on b482 b488 )
    ( on b15 b482 )
    ( on b657 b15 )
    ( on b443 b657 )
    ( on b446 b443 )
    ( on b747 b446 )
    ( on b377 b747 )
    ( on b44 b377 )
    ( on b883 b44 )
    ( on b675 b883 )
    ( on b764 b675 )
    ( on b661 b764 )
    ( on b292 b661 )
    ( on b827 b292 )
    ( on b732 b827 )
    ( on b120 b732 )
    ( on b536 b120 )
    ( on b72 b536 )
    ( on b565 b72 )
    ( clear b565 )
  )
  ( :goal
    ( and
      ( clear b802 )
    )
  )
)
