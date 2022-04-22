( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b979 - block
    b13 - block
    b612 - block
    b954 - block
    b220 - block
    b259 - block
    b893 - block
    b914 - block
    b906 - block
    b719 - block
    b122 - block
    b695 - block
    b829 - block
    b794 - block
    b492 - block
    b374 - block
    b771 - block
    b683 - block
    b774 - block
    b451 - block
    b338 - block
    b465 - block
    b875 - block
    b270 - block
    b632 - block
    b654 - block
    b213 - block
    b297 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b979 )
    ( on b13 b979 )
    ( on b612 b13 )
    ( on b954 b612 )
    ( on b220 b954 )
    ( on b259 b220 )
    ( on b893 b259 )
    ( on b914 b893 )
    ( on b906 b914 )
    ( on b719 b906 )
    ( on b122 b719 )
    ( on b695 b122 )
    ( on b829 b695 )
    ( on b794 b829 )
    ( on b492 b794 )
    ( on b374 b492 )
    ( on b771 b374 )
    ( on b683 b771 )
    ( on b774 b683 )
    ( on b451 b774 )
    ( on b338 b451 )
    ( on b465 b338 )
    ( on b875 b465 )
    ( on b270 b875 )
    ( on b632 b270 )
    ( on b654 b632 )
    ( on b213 b654 )
    ( on b297 b213 )
    ( clear b297 )
  )
  ( :goal
    ( and
      ( clear b979 )
    )
  )
)
