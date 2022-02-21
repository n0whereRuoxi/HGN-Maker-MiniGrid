( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b999 - block
    b457 - block
    b557 - block
    b11 - block
    b889 - block
    b246 - block
    b713 - block
    b18 - block
    b636 - block
    b556 - block
    b768 - block
    b157 - block
    b616 - block
    b462 - block
    b413 - block
    b851 - block
    b743 - block
    b519 - block
    b706 - block
    b149 - block
    b883 - block
    b928 - block
    b137 - block
    b730 - block
    b733 - block
    b518 - block
    b156 - block
    b868 - block
    b542 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b999 )
    ( on b457 b999 )
    ( on b557 b457 )
    ( on b11 b557 )
    ( on b889 b11 )
    ( on b246 b889 )
    ( on b713 b246 )
    ( on b18 b713 )
    ( on b636 b18 )
    ( on b556 b636 )
    ( on b768 b556 )
    ( on b157 b768 )
    ( on b616 b157 )
    ( on b462 b616 )
    ( on b413 b462 )
    ( on b851 b413 )
    ( on b743 b851 )
    ( on b519 b743 )
    ( on b706 b519 )
    ( on b149 b706 )
    ( on b883 b149 )
    ( on b928 b883 )
    ( on b137 b928 )
    ( on b730 b137 )
    ( on b733 b730 )
    ( on b518 b733 )
    ( on b156 b518 )
    ( on b868 b156 )
    ( on b542 b868 )
    ( clear b542 )
  )
  ( :goal
    ( and
      ( clear b999 )
    )
  )
)
