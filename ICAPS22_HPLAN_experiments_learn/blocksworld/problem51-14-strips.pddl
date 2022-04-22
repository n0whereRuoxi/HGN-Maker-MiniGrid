( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b642 - block
    b400 - block
    b207 - block
    b245 - block
    b307 - block
    b994 - block
    b495 - block
    b50 - block
    b382 - block
    b110 - block
    b11 - block
    b561 - block
    b157 - block
    b63 - block
    b369 - block
    b841 - block
    b705 - block
    b24 - block
    b856 - block
    b250 - block
    b690 - block
    b72 - block
    b922 - block
    b910 - block
    b555 - block
    b171 - block
    b296 - block
    b528 - block
    b511 - block
    b468 - block
    b825 - block
    b999 - block
    b60 - block
    b793 - block
    b69 - block
    b757 - block
    b579 - block
    b802 - block
    b453 - block
    b645 - block
    b268 - block
    b474 - block
    b218 - block
    b287 - block
    b181 - block
    b341 - block
    b577 - block
    b902 - block
    b991 - block
    b759 - block
    b874 - block
    b970 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b642 )
    ( on b400 b642 )
    ( on b207 b400 )
    ( on b245 b207 )
    ( on b307 b245 )
    ( on b994 b307 )
    ( on b495 b994 )
    ( on b50 b495 )
    ( on b382 b50 )
    ( on b110 b382 )
    ( on b11 b110 )
    ( on b561 b11 )
    ( on b157 b561 )
    ( on b63 b157 )
    ( on b369 b63 )
    ( on b841 b369 )
    ( on b705 b841 )
    ( on b24 b705 )
    ( on b856 b24 )
    ( on b250 b856 )
    ( on b690 b250 )
    ( on b72 b690 )
    ( on b922 b72 )
    ( on b910 b922 )
    ( on b555 b910 )
    ( on b171 b555 )
    ( on b296 b171 )
    ( on b528 b296 )
    ( on b511 b528 )
    ( on b468 b511 )
    ( on b825 b468 )
    ( on b999 b825 )
    ( on b60 b999 )
    ( on b793 b60 )
    ( on b69 b793 )
    ( on b757 b69 )
    ( on b579 b757 )
    ( on b802 b579 )
    ( on b453 b802 )
    ( on b645 b453 )
    ( on b268 b645 )
    ( on b474 b268 )
    ( on b218 b474 )
    ( on b287 b218 )
    ( on b181 b287 )
    ( on b341 b181 )
    ( on b577 b341 )
    ( on b902 b577 )
    ( on b991 b902 )
    ( on b759 b991 )
    ( on b874 b759 )
    ( on b970 b874 )
    ( clear b970 )
  )
  ( :goal
    ( and
      ( clear b642 )
    )
  )
)
