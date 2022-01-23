package com.pk.event;

import java.util.List;

import com.pk.event.request.EventCreate;
import com.pk.event.request.EventUpdate;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
public class EventService {
  private EventRepository eventRepository;

  public List<Event> getAll() {
    return eventRepository.getAll();
  }

  public Event findById(Integer id) {
    return eventRepository.findById(id);
  }

  public Boolean deleteById(Integer id) {
    return eventRepository.deleteById(id);
  }

  public Boolean update(EventUpdate event) {
    Event temp = eventRepository.findById(event.getId());
    if (temp == null) {
      log.warn("Account doesn't exist");
      return false;
    }

    // I have to check if such a apiary exists, if not then return false and log message
    if (event.getIdApiary() == null) {
      event.setIdApiary(temp.getIdApiary());
    }

    if (event.getStart() == null) {
      event.setStart(temp.getStart());
    }

    if (event.getEnd() == null) {
      event.setEnd(temp.getEnd());
    }

    if (event.getNote() == null) {
      event.setNote(temp.getNote());
    }

    return eventRepository.update(event);
  }

  public Integer save(EventCreate event) {
    // I have to check if such a apiary exists, if not then return false and log
    // message
    return eventRepository.save(event);
  }
}