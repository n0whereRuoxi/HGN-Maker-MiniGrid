( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b431 - block
    b288 - block
    b719 - block
    b33 - block
    b947 - block
    b346 - block
    b772 - block
    b794 - block
    b961 - block
    b386 - block
    b999 - block
    b625 - block
    b470 - block
    b631 - block
    b753 - block
    b402 - block
    b124 - block
    b198 - block
    b454 - block
    b369 - block
    b525 - block
    b556 - block
    b873 - block
    b197 - block
    b864 - block
    b664 - block
    b185 - block
    b985 - block
    b349 - block
    b923 - block
    b125 - block
    b609 - block
    b807 - block
    b967 - block
    b243 - block
    b64 - block
    b195 - block
    b562 - block
    b585 - block
    b695 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b431 )
    ( on b288 b431 )
    ( on b719 b288 )
    ( on b33 b719 )
    ( on b947 b33 )
    ( on b346 b947 )
    ( on b772 b346 )
    ( on b794 b772 )
    ( on b961 b794 )
    ( on b386 b961 )
    ( on b999 b386 )
    ( on b625 b999 )
    ( on b470 b625 )
    ( on b631 b470 )
    ( on b753 b631 )
    ( on b402 b753 )
    ( on b124 b402 )
    ( on b198 b124 )
    ( on b454 b198 )
    ( on b369 b454 )
    ( on b525 b369 )
    ( on b556 b525 )
    ( on b873 b556 )
    ( on b197 b873 )
    ( on b864 b197 )
    ( on b664 b864 )
    ( on b185 b664 )
    ( on b985 b185 )
    ( on b349 b985 )
    ( on b923 b349 )
    ( on b125 b923 )
    ( on b609 b125 )
    ( on b807 b609 )
    ( on b967 b807 )
    ( on b243 b967 )
    ( on b64 b243 )
    ( on b195 b64 )
    ( on b562 b195 )
    ( on b585 b562 )
    ( on b695 b585 )
    ( clear b695 )
  )
  ( :goal
    ( and
      ( clear b431 )
    )
  )
)
