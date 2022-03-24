( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b788 - block
    b93 - block
    b80 - block
    b907 - block
    b444 - block
    b756 - block
    b596 - block
    b197 - block
    b533 - block
    b898 - block
    b239 - block
    b927 - block
    b618 - block
    b443 - block
    b90 - block
    b447 - block
    b370 - block
    b256 - block
    b306 - block
    b56 - block
    b922 - block
    b391 - block
    b432 - block
    b393 - block
    b564 - block
    b173 - block
    b814 - block
    b454 - block
    b729 - block
    b76 - block
    b164 - block
    b616 - block
    b73 - block
    b589 - block
    b124 - block
    b644 - block
    b472 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b788 )
    ( on b93 b788 )
    ( on b80 b93 )
    ( on b907 b80 )
    ( on b444 b907 )
    ( on b756 b444 )
    ( on b596 b756 )
    ( on b197 b596 )
    ( on b533 b197 )
    ( on b898 b533 )
    ( on b239 b898 )
    ( on b927 b239 )
    ( on b618 b927 )
    ( on b443 b618 )
    ( on b90 b443 )
    ( on b447 b90 )
    ( on b370 b447 )
    ( on b256 b370 )
    ( on b306 b256 )
    ( on b56 b306 )
    ( on b922 b56 )
    ( on b391 b922 )
    ( on b432 b391 )
    ( on b393 b432 )
    ( on b564 b393 )
    ( on b173 b564 )
    ( on b814 b173 )
    ( on b454 b814 )
    ( on b729 b454 )
    ( on b76 b729 )
    ( on b164 b76 )
    ( on b616 b164 )
    ( on b73 b616 )
    ( on b589 b73 )
    ( on b124 b589 )
    ( on b644 b124 )
    ( on b472 b644 )
    ( clear b472 )
  )
  ( :goal
    ( and
      ( clear b788 )
    )
  )
)
