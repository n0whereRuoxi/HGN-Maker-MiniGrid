( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b547 - block
    b649 - block
    b137 - block
    b236 - block
    b150 - block
    b50 - block
    b349 - block
    b164 - block
    b240 - block
    b780 - block
    b960 - block
    b505 - block
    b774 - block
    b234 - block
    b994 - block
    b972 - block
    b391 - block
    b687 - block
    b549 - block
    b370 - block
    b538 - block
    b21 - block
    b647 - block
    b736 - block
    b785 - block
    b621 - block
    b834 - block
    b446 - block
    b810 - block
    b683 - block
    b287 - block
    b166 - block
    b753 - block
    b7 - block
    b468 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b547 )
    ( on b649 b547 )
    ( on b137 b649 )
    ( on b236 b137 )
    ( on b150 b236 )
    ( on b50 b150 )
    ( on b349 b50 )
    ( on b164 b349 )
    ( on b240 b164 )
    ( on b780 b240 )
    ( on b960 b780 )
    ( on b505 b960 )
    ( on b774 b505 )
    ( on b234 b774 )
    ( on b994 b234 )
    ( on b972 b994 )
    ( on b391 b972 )
    ( on b687 b391 )
    ( on b549 b687 )
    ( on b370 b549 )
    ( on b538 b370 )
    ( on b21 b538 )
    ( on b647 b21 )
    ( on b736 b647 )
    ( on b785 b736 )
    ( on b621 b785 )
    ( on b834 b621 )
    ( on b446 b834 )
    ( on b810 b446 )
    ( on b683 b810 )
    ( on b287 b683 )
    ( on b166 b287 )
    ( on b753 b166 )
    ( on b7 b753 )
    ( on b468 b7 )
    ( clear b468 )
  )
  ( :goal
    ( and
      ( clear b547 )
    )
  )
)
