( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b35 - block
    b361 - block
    b812 - block
    b748 - block
    b733 - block
    b768 - block
    b987 - block
    b656 - block
    b185 - block
    b778 - block
    b496 - block
    b419 - block
    b744 - block
    b981 - block
    b590 - block
    b292 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b35 )
    ( on b361 b35 )
    ( on b812 b361 )
    ( on b748 b812 )
    ( on b733 b748 )
    ( on b768 b733 )
    ( on b987 b768 )
    ( on b656 b987 )
    ( on b185 b656 )
    ( on b778 b185 )
    ( on b496 b778 )
    ( on b419 b496 )
    ( on b744 b419 )
    ( on b981 b744 )
    ( on b590 b981 )
    ( on b292 b590 )
    ( on b222 b292 )
    ( clear b222 )
  )
  ( :tasks
    ( Make-16Pile b361 b812 b748 b733 b768 b987 b656 b185 b778 b496 b419 b744 b981 b590 b292 b222 )
  )
)
